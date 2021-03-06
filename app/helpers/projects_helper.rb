module ProjectsHelper
  def project_filter_options
    [
      ['Nombre', :name],
      ['Categoria', :category],
      ['Area Temática', :area],
      ['Profesor', :professor],
      ['Departamento', :department],
      # ['Materia Relacionada', :],
      ['Campus', :institution],
      ['Sevicio Social', :social_service],
    ]
  end

  # Escala de calificación de calidad 
  def project_status_options_for_professor(project_id)
    [['0', "#{project_id}:registered"], ['1', "#{project_id}:disapproved"], ['2', "#{project_id}:disapproved"], ['3', "#{project_id}:disapproved"], ['4', "#{project_id}:approved"],
    ['5', "#{project_id}:approved"]]
  end

  def project_status_options_for_admin(project_id)
    [['Registrado', "#{project_id}:registered"], ['Aprobado', "#{project_id}:approved"], 
    ['No aprobado', "#{project_id}:disapproved"], ['Evaluado', "#{project_id}:evaluated"], 
    ['Aceptado', "#{project_id}:accepted"], ['Rechazado', "#{project_id}:rejected"], 
    ['Declinado', "#{project_id}:declined"], ['Faltó', "#{project_id}:missed"]]
  end

  def project_status_options_for_operative(project_id)
    [['Aceptado', 'accepted'], ['Faltó', "#{project_id}:missed"]]
  end

  def project_status_options_for_committee_member(project_id)
    [['Aceptado', "#{project_id}:accepted"], ['Faltó', "#{project_id}:missed"]]
  end


  def project_area(project)
    project_detail = project.project_detail
    project_detail.area
  end

  def project_description(project)
    project_detail = project.project_detail
    project_detail.description
  end

  def project_name(project)
    project_detail = project.project_detail
    project_detail.name
  end

  def project_professor(project)
    professor = project.professor
    user = professor.user
    user.full_name
  end

  def project_professor_email(project)
    professor = project.professor
    user = professor.user
    user.email
  end

  def project_score(project)
    committee_evaluation = project.committee_evaluation
    if committee_evaluation.problem == nil
      committee_evaluation.problem = 0
    end
    if committee_evaluation.methodology == nil
      committee_evaluation.methodology = 0
    end
    if committee_evaluation.feasibility == nil
      committee_evaluation.feasibility = 0
    end
    if committee_evaluation.results == nil
      committee_evaluation.results = 0
    end
    if committee_evaluation.impact == nil
      committee_evaluation.impact = 0
    end
    if committee_evaluation.ortography == nil
      committee_evaluation.ortography = 0
    end
    if committee_evaluation.description == nil
      committee_evaluation.description = 0
    end
    committee_evaluation.score + committee_evaluation.problem + committee_evaluation.methodology + committee_evaluation.feasibility + committee_evaluation.results + committee_evaluation.impact + committee_evaluation.ortography + committee_evaluation.description
  end

  def project_stand(project)
    if project.project_event_detail
      project_event_details.stand
    else 
      nil
    end
  end

  def project_student(project)
    student = project.student
    user = student.user
    user.full_name
  end

  def project_student_email(project)
    student = project.student
    user = student.user
    user.email
  end

  def display_project_area(project)
    project_detail = project.project_detail
    display_project_detail_area(project_detail)
  end

  def display_project_professor_info(project)
    project_professor = project_professor(project)
    project_professor_email = project_professor_email(project)
    return "#{project_professor} - #{project_professor_email}"
  end


  def display_project_score(project)
    project_score = project_score(project)
    project_score.present? ? project_score : "N/A"
  end

  def display_project_stand(project)
    project_stand = project_stand(project)
    project_stand.present? ? project_stand : "N/A"
  end

  def display_project_status(project)
    project_status = project.status
    project_status_options().find { |key, value| value == project_status }.first
  end

  def display_project_student_info(project)
    project_student = project_student(project)
    project_student_email = project_student_email(project)
    return "#{project_student} - #{project_student_email}"
  end
 
end
