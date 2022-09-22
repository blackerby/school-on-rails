import pandas as pd


def read_school():
    return (
        pd.read_csv("iss_fall_2022.csv")
        .rename(columns=lambda header: header.lower().replace(" ", "_"))
        .rename(columns={"#_enrolled": "num_enrolled"})
        .drop(
            columns=[
                "duration",
                "course_length",
                "section",
                "num_enrolled",
                "student_list",
                "course_total",
                "department_total",
            ]
        )
    )


def read_teachers():
    return pd.read_csv("teachers.csv").drop(
        columns=[
            "email",
            "created_at",
            "updated_at",
            "department_id",
        ]
    )


def read_blocks():
    return (
        pd.read_csv("blocks.csv")
        .drop(columns=["created_at", "updated_at"])
        .rename(columns={"id": "block_id", "name": "block"})
    )


def read_classrooms():
    return (
        pd.read_csv("classrooms.csv")
        .drop(columns=["created_at", "updated_at"])
        .rename(columns={"name": "room", "id": "classroom_id"})
    )


# Get base data and drop empty rows
school = read_school().dropna()

# Get remaining data
teachers = read_teachers()
blocks = read_blocks()
classrooms = read_classrooms()

# Prep teacher data for merging
teachers["teacher"] = teachers["first_name"] + " " + teachers["last_name"]
teachers = teachers.drop(columns=["first_name", "last_name"])

# Merge teacher data
classes = (
    pd.merge(school, teachers, on="teacher", how="inner")
    .drop(columns=["department", "teacher"])
    .rename(columns={"id": "teacher_id"})
)

# Merge block data
classes = pd.merge(classes, blocks, on="block", how="inner").drop(columns="block")

# Merge classroom data
classes = pd.merge(classes, classrooms, on="room", how="inner").drop(columns="room")

# Write to file for ingest
classes.to_csv("meetings.csv", index=False)
