coaches = Coach.create!([{name: 'Jonas', email: 'jonas.preisler@gmail.com', password: 'testtest', password_confirmation: 'testtest'}, {name: 'Roy', email: 'roy@gmail.com', password: 'testtest', password_confirmation: 'testtest'}])
course_categories = CourseCategory.create!([{name: 'Baby'}, {name: 'Småbarn'}, {name: 'Barn'}, {name: 'Barnehage Svømning'}, {name: 'Vanntrim'}, {name: 'Triathlonkids'}])
course_niveaus = CourseNiveau.create!([{name: 'Nybegynner'}, {name: 'Øvet'}, {name: 'Videregående'}])
course_places = CoursePlace.create!([{name: 'Asker Vettre Thon Hotell'}, {name: 'Hokksund Kurbad'}, {name: 'Landøya Barnehage'}, {name: 'Oslo-Sofienbergsenteret'}, {name: 'Risenga Storbassenget(25m)'}, {name: 'Risenga Terapibassenget'}])
courses = Course.create!([{coach_id: 1, price: '1500', course_niveau_id: 1, course_category_id: 1, course_place_id: 6, time_from: '15:30:00', time_to: '16:00:00', day: '2018-12-20'},
																			{coach_id: 1, price: '1500', course_niveau_id: 2, course_category_id: 1, course_place_id: 6, time_from: '16:00:00', time_to: '16:30:00', day: '2018-12-20'},
																			{coach_id: 1, price: '1500', course_niveau_id: 3, course_category_id: 1, course_place_id: 6, time_from: '16:00:00', time_to: '16:30:00', day: '2018-12-22'},
																			{coach_id: 1, price: '1500', course_niveau_id: 1, course_category_id: 1, course_place_id: 6, time_from: '15:30:00', time_to: '16:00:00', day: '2018-12-21'},
																			{coach_id: 2, price: '1500', course_niveau_id: 2, course_category_id: 1, course_place_id: 6, time_from: '16:00:00', time_to: '16:30:00', day: '2018-12-24'},
																			{coach_id: 2, price: '1500', course_niveau_id: 3, course_category_id: 1, age_from: 1, age_to: 2, course_place_id: 6, time_from: '16:30:00', time_to: '17:00:00', day: '2018-12-20'},
																			{coach_id: 2, price: '1500', course_category_id: 2, age_from: 3, age_to: 4, course_place_id: 6, time_from: '17:00:00', time_to: '17:30:00', day: '2018-12-24'},
																			{coach_id: 2, price: '1500', course_category_id: 2, age_from: 2, age_to: 3, course_place_id: 6, time_from: '16:30:00', time_to: '17:00:00', day: '2018-12-20'},
																			{coach_id: 2, price: '1500', course_category_id: 2, age_from: 3, age_to: 4, course_place_id: 6, time_from: '17:00:00', time_to: '17:30:00', day: '2018-12-20'}
																			])
