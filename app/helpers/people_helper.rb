module PeopleHelper
  def lender_link(lender, title = lender.name)
    "#{title} (#{lender.borrowed_things.count })"
  end
end
