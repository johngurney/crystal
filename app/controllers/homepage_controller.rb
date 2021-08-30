require 'prawn'

class HomepageController < ApplicationController

  # skip_before_action :verify_authenticity_token, only: [:position, :xmas_position, :crib_move_card, :crib_player_up, :crib_player_down, :crib_reset, :test, :whosecrib]
  # before_action :get_player, only: [:crib, :crib_player, :crib_move_card, :crib_reset, :test, :whosecrib]

  def homepage

  end

  def cookie_consent

    cookies.permanent[:cookie_consent] = true if params[:cookie_consent] == "1"
    redirect_to root_path
  end

  def reset_cookie_consent

    cookies.permanent[:cookie_consent] = nil
    session[:cookie_consent] = nil
    redirect_to root_path

  end

  def log_in
    email = params[:email].downcase
    if !email.blank?
      user = nil
      User.all.each do |user1|
        if user1.email.downcase == email
          user = user1
          break
        end
      end
      if !user.blank?
        if user.password == params[:password] or true
          cookies.permanent[:logged_in_token] = user.id
          session[:logged_in_user] = user.id
          redirect_to root_path
          return
        end
      end
    end
    render 'homepage/password'

  end

  def log_out

    # Loginlog.where(:token => cookies.permanent[:logged_in_token].to_s).delete_all
    cookies.permanent[:logged_in_token] = nil
    session[:logged_in_user] = nil
    redirect_to root_path
  end

  def search
    @developments = Development.all
    @start_date = params[:start_date]
    @end_date = params[:end_date]
    puts "start_date: " + @start_date
    render "search_return"

  end

  def search_select
    redirect_to root_path

  end

  def timeline_pdf

    start_date  = Date.strptime(params[:start_date])
    end_date  = Date.strptime(params[:end_date])
    puts "start_date" + start_date.to_s

    pdf = Prawn::Document.new(:page_layout => :landscape)
    pdf.text("hello")
    pdf.text("top" + pdf.bounds.top.to_s)
    pdf.text("bottom" + pdf.bounds.bottom.to_s)
    pdf.text("left" + pdf.bounds.left.to_s)
    pdf.text("right" + pdf.bounds.right.to_s)

    pdf.text start_date.to_s(:short)
    pdf.text end_date.to_s(:short)

    pdf.fill_color "c00000"
    pdf.fill_rectangle [20, 20], 20 ,20

    pdf.fill_color "0000c0"
    pdf.fill_rectangle [40, 40], 20 ,20

    send_data pdf.render, :filename => "timeline" + ".pdf", :type => "application/pdf"


  end

  def make_box(text,position, width, pdf, color = nil )
    Prawn::Text::Formatted::Box.new([{:text => text}],
                    {:at => position,
                    :size => 8,
                    :width => width,
                    :single_line => true,
                    :overflow => :truncate,
                    :color => color.blank? ? "ff0000" : color ,
                    :document => pdf })

  end
end
