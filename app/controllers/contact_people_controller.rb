class ContactPeopleController < ApplicationController
  before_action :set_contact_person, only: [:show, :edit, :update, :destroy]
  layout 'signup', except: :legg_til_kontakt_person

  def legg_til_kontaktperson
    @contact_person = ContactPerson.new
  end
  def legg_til_kontakt_person
    @contact_person = ContactPerson.new
    @contact_people = ContactPerson.where(member_id: current_member)
    render layout: 'account'
  end

  def kontaktperson
    @contact_person = ContactPerson.new
    @member = current_member
  end

  def index
    @contact_people = ContactPerson.all
  end

  # GET /contact_people/1
  # GET /contact_people/1.json
  def show
  end

  # GET /contact_people/new
  def new
    @contact_person = ContactPerson.new
  end

  # GET /contact_people/1/edit
  def edit
  end

  # POST /contact_people
  # POST /contact_people.json
  def create
    @contact_person = ContactPerson.new(contact_person_params)
    @contact_person.member_id = current_member.id if member_signed_in?

    respond_to do |format|
      if member_signed_in?
        if @contact_person.save
          format.html { redirect_to legg_til_kontakt_person_path, notice: 'Kontaktperson ble opprettet.' }
          format.json { render :show, status: :created, location: @contact_person }
        else
          format.html { render :new }
          format.json { render json: @contact_person.errors, status: :unprocessable_entity }
        end
      else
        if @contact_person.save
          format.html { redirect_to @contact_person, notice: 'Kontaktperson ble opprettet.' }
          format.json { render :show, status: :created, location: @contact_person }
        else
          format.html { render :new }
          format.json { render json: @contact_person.errors, status: :unprocessable_entity }
        end
      end
    end
  end

  # PATCH/PUT /contact_people/1
  # PATCH/PUT /contact_people/1.json
  def update
    respond_to do |format|
      if @contact_person.update(contact_person_params)
        format.html { redirect_to @contact_person, notice: 'Kontaktperson ble oppdattert.' }
        format.json { render :show, status: :ok, location: @contact_person }
      else
        format.html { render :edit }
        format.json { render json: @contact_person.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /contact_people/1
  # DELETE /contact_people/1.json
  def destroy
    @contact_person.destroy
    respond_to do |format|
      format.html { redirect_to contact_people_url, notice: 'Kontaktperson ble slettet.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_contact_person
      @contact_person = ContactPerson.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def contact_person_params
      params.require(:contact_person).permit(:first_name, :last_name, :member_id, :child_id, :course_id, :order_id, :participation_id, :phone, :relation)
    end
end
