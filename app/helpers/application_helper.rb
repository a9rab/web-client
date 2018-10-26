module ApplicationHelper

    def notification_class(type)
        case type
            when 'notice'
                'primary'
            when 'alert'
                'danger'
            else
                'info'
        end
    end

end
