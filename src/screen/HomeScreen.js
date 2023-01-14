import {
  StyleSheet,
  Text,
  SafeAreaView,
  View,
  TouchableOpacity,
} from 'react-native';
import React from 'react';

const HomeScreen = ({navigation}) => {
  return (
    <SafeAreaView style={styles.container}>
      <View style={styles.contentContainer}>
        <Text style={styles.mainText}>This is the Main Screen</Text>
        <TouchableOpacity onPress={() => navigation.navigate('Page 1')}>
          <Text style={styles.buttonText}>Go the Next Page</Text>
        </TouchableOpacity>
      </View>
    </SafeAreaView>
  );
};

export default HomeScreen;

const styles = StyleSheet.create({
  container: {
    flex: 1,
    justifyContent: 'center',
  },
  contentContainer: {
    alignSelf: 'center',
    alignItems: 'center',
  },
  mainText: {
    fontSize: 18,
    marginBottom: 10,
  },
  buttonText: {
    color: '#3366CC',
  },
});
