module TeachersHelper
  def link_to_department(department)
    if department
      link_to department.name, department_path(department)
    else
      'No Department Assigned'
    end
  end
end
