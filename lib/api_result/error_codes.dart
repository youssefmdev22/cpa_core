class ErrorCodes {
  static const all = {
    // AUTH
    '1000': 'Required fields are missing',
    '1001': 'Invalid credentials',
    '1002': 'Invalid email',
    '1003': 'Invalid old password',
    '1004': 'Invalid token',
    '1005': 'User not found',
    '1006': 'User already exists',
    '1007': 'Email already exists',
    '1008': 'Username already exists',
    '1009': 'IP already exists',
    '1010': 'Refer ID not found',
    '1011': 'User not active',
    '1012': 'User not verified',
    '1013': 'User not authorized',
    '1014': 'Admin not found',
    '1015': 'Admin already exists',
    '1016': 'Invalid reset code',

    // CONFIG
    '2000': 'Key already exists',
    '2001': 'Config not found',

    // OFFERWALL
    '3000': 'Offerwall not found',
    '3001': 'Offerwall type not found',

    // PAYOUT
    '4000': 'Payout not found',
    '4001': 'Invalid payout options',
    '4002': 'Insufficient points',

    // REFERER
    '5000': 'Referer not found',
    '5001': 'IP already exists',

    // REQUEST
    '6000': 'Request not found',
    '6001': 'Not enough points',
    '6002': 'Invalid payment ID',
    '6003': 'Invalid option ID',

    // USER
    '7000': 'User not found',
    '7001': 'User already exists',
    '7002': 'Invalid user type',
    '7003': 'User is private',

    // LEADERBOARD
    '8000': 'Leaderboard not found',

    // TRACKER
    '9000': 'Tracker not found',

    // NOTIFICATION
    '10000': 'Notification not found',

    // POSTBACK
    '11000': 'Postback not found',
    '11001': 'Postback unauthorized',

    // GENERAL
    '12000': 'Server error',
    '12001': 'Required fields',
    '12002': 'Bad request',
    '12003': 'Internal error',
  };
}
