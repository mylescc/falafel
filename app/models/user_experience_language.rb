class UserExperienceLanguage < ActiveRecord::Base
  include CommonExperienceEnumerations
  include ActivityMapper
  belongs_to :user
  #validates :user, :primary_activity, presence: true

  enum primary_activity: {
    'COBOL' => 1,
    'CSS' => 2,
    'C++' => 3,
    'DBMS' => 4,
    'RDBMS' => 5,
    'HTML' => 6,
    'Java' => 7,
    'Javascipt' => 8,
    '.Net' => 9,
    'PHP' => 10,
    'Python' => 11,
    'Ruby' => 12,
    'SQL' => 13,
    'XML' => 14
  }

  enum secondary_activity: {
    'DB2' => 1,
    'MongoDB' => 2,
    'MySQL' => 3,
    'NoSQL' => 4,
    'Oracle' => 5,
    'Postgres' => 6,
    'SQL Server' => 7,
    'Sybase' => 8,
    'Spring' => 9,
    'Swing' => 10,
    'EJB' => 11,
    'Hibernate' => 12,
    'JDBC' => 13,
    'JSF' => 14,
    'JSP' => 15,
    'J2EE' => 16,
    'Servlets' => 17,
    'ASP.net' => 18,
    'C#' => 19,
    'MVC' => 20,
    'VB.Net' => 21,
    'WCF' => 22,
    'WebAPI' => 23,
    'WPF' => 24
  }

  add_enums :years_experience, :expertise

  def self.secondary_activity_map
    {
      #rdbms
      5 => (1..10).to_a,
      #java
      7 => (11..17).to_a,
      #.net
      9 => (18..24).to_a
    }
  end
end
